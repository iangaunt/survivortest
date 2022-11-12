-- [[ services ]] --
local ReplicatedStorage, Players = game:GetService("ReplicatedStorage"), game:GetService("Players")

-- [[ modules ]] --
local Roact = require(ReplicatedStorage.Roact)

-- [[ objects ]] --
local Player = Players.LocalPlayer
local e = Roact.createElement

-- [[ variables ]] --
local backgroundImage = "http://www.roblox.com/asset/?id=11534938622"

-- [[ elements ]] --
local function Button(notes: {LayoutOrder: number, Name: string, Size: UDim2, SliceScale: number, Text: string})
    return e("ImageButton", {
        Name = notes.Name,

        BackgroundTransparency = 1,
        Image = backgroundImage,
        LayoutOrder = notes.LayoutOrder,
        ScaleType = "Slice",
        Size = notes.Size,
        SliceCenter = Rect.new(300, 80, 500, 720),
        SliceScale = notes.SliceScale
    }, {
        Gradient = e("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(202, 230, 255)),
            }),
            Rotation = 90,
        }),
        Text = e("TextLabel", {
            Name = "Text",

            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Font = "Roboto",
            Position = UDim2.new(0.5, 0, 0.5, 0),
            RichText = true,
            Size = UDim2.new(0.9, 0, 0.7, 0),
            Text = notes.Text,
            TextColor3 = Color3.fromRGB(216, 216, 216),
            TextScaled = true
        })
    })
end

local HostKitApp = e("Frame", {
    Name = "HostKitApp",

    AnchorPoint = Vector2.new(1, 1),
    BackgroundTransparency = 1,
    Position = UDim2.new(1, 0, 1, 0),
    Size = UDim2.new(0.191, 0, 0.543, 0)
}, {
    UIAspectRatioConstraint = e("UIAspectRatioConstraint", {
        AspectRatio = 0.714
    }),
    Container = e("Frame", {
        Name = "Container",

        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0.964, 0, 0.974, 0)
    }, {
        UIListLayout = e("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0.01, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Header = Button({
            LayoutOrder = 1,
            Name = "Header",
            Size = UDim2.new(1, 0, 0.15, 0),
            SliceScale = 0.15,
            Text = '<font color="#2c74b8">H</font><i>Kit</i>'
        }),
        Content = e("ImageLabel", {
            Name = "Content",

            BackgroundTransparency = 1,
            Image = backgroundImage,
            LayoutOrder = 2,
            ScaleType = "Slice",
            Size = UDim2.new(1, 0, 0.84, 0),
            SliceScale = 0.15,
            SliceCenter = Rect.new(300, 80, 500, 720),
        }, {
            UIGradient = e("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(168, 168, 168))
                }),
                Rotation = 100
            }),
            MainKit = e("Frame", {
                Name = "MainKit",

                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(0.925, 0, 0.937, 0),
            }, {
                UIListLayout = e("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                NavBar = e("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0.15, 0)
                }, {
                    UIListLayout = e("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }),
                    Back = Button({
                        LayoutOrder = 1,
                        Name = "Back",
                        Size = UDim2.new(0.15, 0, 0.885, 0),
                        SliceScale = 0.15,
                        Text = "×",
                    }),
                    Header = e("ImageLabel", {
                        BackgroundTransparency = 1,
                        Image = backgroundImage,
                        ImageColor3 = Color3.fromRGB(177, 177, 177),
                        LayoutOrder = 2,
                        ScaleType = "Slice",
                        Size = UDim2.new(0.84, 0, 0.83, 0),
                        SliceCenter = Rect.new(106, 80, 698, 720),
                        SliceScale = 0.06
                    })
                }),
                Lists = e("Frame", {
                    
                }, {

                })
            })
        })
    })
})

-- [[ functions ]] --
--[[local button = e(Button, {
    parent = script.Parent,
    text = "hello!",
    layout = 1,
    size = UDim2.new(0.3, 0, 0.3, 0)
})

Roact.mount(button, script.Parent)]]--

Roact.mount(HostKitApp, script.Parent)