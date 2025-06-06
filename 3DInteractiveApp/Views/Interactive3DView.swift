//
//  Interactive3DView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI
import SceneKit

struct Interactive3DView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = create3DScene()
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = false
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
    
    private func create3DScene() -> SCNScene {
        let scene = SCNScene()
        
        // Add camera at the beginning
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        // Create a rotating cube
        let cubeGeometry = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0.3)
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = UIColor.systemCyan
        cubeMaterial.specular.contents = UIColor.white
        // Material enhancement
        cubeMaterial.lightingModel = .physicallyBased
        cubeMaterial.metalness.contents = 0.2
        cubeMaterial.roughness.contents = 0.3
        cubeMaterial.emission.contents = UIColor.black
        cubeGeometry.materials = [cubeMaterial]
        
        let cubeNode = SCNNode(geometry: cubeGeometry)
        scene.rootNode.addChildNode(cubeNode)
        
        // Add rotation animation
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 3)
        let repeatRotation = SCNAction.repeatForever(rotation)
        cubeNode.runAction(repeatRotation)
        
        // Add ambient light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor(white: 0.4, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        // Add omni light with attenuation and shadow
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.light?.color = UIColor.white
        lightNode.position = SCNVector3(0, 10, 10)
        // Attenuation on existing omni light
        lightNode.light?.attenuationStartDistance = 5
        lightNode.light?.attenuationEndDistance = 20
        lightNode.light?.attenuationFalloffExponent = 2
        lightNode.light?.castsShadow = true
        lightNode.light?.shadowMode = .forward
        lightNode.light?.shadowColor = UIColor.black.withAlphaComponent(0.4)
        lightNode.light?.shadowRadius = 4
        scene.rootNode.addChildNode(lightNode)
        
        // Directional light
        let directionalLight = SCNNode()
        directionalLight.light = SCNLight()
        directionalLight.light?.type = .directional
        directionalLight.light?.color = UIColor.white
        directionalLight.eulerAngles = SCNVector3(-Float.pi / 3, Float.pi / 4, 0)
        directionalLight.light?.castsShadow = true
        directionalLight.light?.shadowMode = .forward
        directionalLight.light?.shadowColor = UIColor.black.withAlphaComponent(0.4)
        directionalLight.light?.shadowRadius = 5
        scene.rootNode.addChildNode(directionalLight)
        
        // Accent (color) light
        let accentLight = SCNNode()
        accentLight.light = SCNLight()
        accentLight.light?.type = .omni
        accentLight.light?.color = UIColor.cyan
        accentLight.position = SCNVector3(-5, 3, 5)
        scene.rootNode.addChildNode(accentLight)
        
        return scene
    }
}


