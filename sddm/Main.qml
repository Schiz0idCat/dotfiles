import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import QtMultimedia

import "Components"

Pane {
    id: root

    height: config.ScreenHeight || Screen.height
    width: config.ScreenWidth || Screen.ScreenWidth
    padding: config.ScreenPadding

    LayoutMirroring.enabled: config.RightToLeftLayout == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    palette.window: config.BackgroundColor
    palette.highlight: config.HighlightBackgroundColor
    palette.highlightedText: config.HighlightTextColor
    palette.buttonText: config.HoverSystemButtonsIconsColor

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height / 80) || 13
    
    focus: true

    property bool leftleft: config.HaveFormBackground == "true" &&
                            config.PartialBlur == "false" &&
                            config.FormPosition == "left" &&
                            config.BackgroundHorizontalAlignment == "left"

    property bool leftcenter: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "left" &&
                              config.BackgroundHorizontalAlignment == "center"

    property bool rightright: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "right" &&
                              config.BackgroundHorizontalAlignment == "right"

    property bool rightcenter: config.HaveFormBackground == "true" &&
                               config.PartialBlur == "false" &&
                               config.FormPosition == "right" &&
                               config.BackgroundHorizontalAlignment == "center"

    Item {
        id: sizeHelper

        height: parent.height
        width: parent.width
        anchors.fill: parent
        
        Rectangle {
            id: tintLayer

            height: parent.height
            width: parent.width
            anchors.fill: parent
            z: 1
            color: config.DimBackgroundColor
            opacity: config.DimBackground
        }

        Rectangle {
            id: formBackground

            anchors.fill: form
            anchors.centerIn: form
            z: 1

            color: config.FormBackgroundColor
            visible: config.HaveFormBackground == "true" ? true : false
            opacity: config.PartialBlur == "true" ? 0.3 : 1
        }

        LoginForm {
            id: form

            height: parent.height
            width: parent.width / 2.5
            anchors.left: config.FormPosition == "left" ? parent.left : undefined
            anchors.horizontalCenter: config.FormPosition == "center" ? parent.horizontalCenter : undefined
            anchors.right: config.FormPosition == "right" ? parent.right : undefined
            z: 1
        }

        Image {
            id: backgroundImage

            anchors.fill: parent
            fillMode: config.CropBackground == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit

            horizontalAlignment: config.BackgroundHorizontalAlignment == "left" ?
            Image.AlignLeft :
            config.BackgroundHorizontalAlignment == "right" ?
            Image.AlignRight : Image.AlignHCenter

            verticalAlignment: config.BackgroundVerticalAlignment == "top" ?
            Image.AlignTop :
            config.BackgroundVerticalAlignment == "bottom" ?
            Image.AlignBottom : Image.AlignVCenter

            source: config.Background || ""

            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }

        MouseArea {
            anchors.fill: backgroundImage
            onClicked: parent.forceActiveFocus()
        }

        ShaderEffectSource {
            id: blurMask

            height: parent.height
            width: form.width
            anchors.centerIn: form

            sourceItem: backgroundImage
            sourceRect: Qt.rect(x,y,width,height)
            visible: config.FullBlur == "true" || config.PartialBlur == "true" ? true : false
        }

        MultiEffect {
            id: blur

            height: parent.height

            // width: config.FullBlur == "true" ? parent.width : form.width
            // anchors.centerIn: config.FullBlur == "true" ? parent : form

            // This solves problem when FullBlur and HaveFormBackground is set to true but PartialBlur is false and FormPosition isn't center.
            width: (config.FullBlur == "true" && config.PartialBlur == "false" && config.FormPosition != "center" ) ? parent.width - formBackground.width : config.FullBlur == "true" ? parent.width : form.width 
            anchors.centerIn: config.FullBlur == "true" ? backgroundImage : form

            source: config.FullBlur == "true" ? backgroundImage : blurMask
            blurEnabled: true
            autoPaddingEnabled: false
            blur: config.Blur == "" ? 2.0 : config.Blur
            blurMax: config.BlurMax == "" ? 48 : config.BlurMax
            visible: config.FullBlur == "true" || config.PartialBlur == "true" ? true : false
        }
    }
}
