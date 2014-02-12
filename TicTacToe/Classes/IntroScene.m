//
//  IntroScene.m
//  TicTacToe
//
//  Created by Matheus Felipe on 12/02/14.
//  Copyright matbhz 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Import the interfaces
#import "IntroScene.h"
#import "TicTacToeScene.h"

// -----------------------------------------------------------------------
#pragma mark - IntroScene
// -----------------------------------------------------------------------

@implementation IntroScene

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (IntroScene *)scene {
    return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init {
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return (nil);

    //TODO: Resize image to fit on the screen
    CCNode *background = [CCSprite spriteWithImageNamed:@"Chalkboard.jpg"];
    [self addChild:background];

    // Main menu
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Tic Tac Toe!" fontName:@"Chalkduster" fontSize:35.0f];
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor whiteColor];
    label.position = ccp(0.5f, 0.7f); // Middle of screen
    [self addChild:label];

    // TicTacToe game scene button
    CCButton *playButton = [CCButton buttonWithTitle:@"Play" fontName:@"Chalkduster" fontSize:30.0f];
    playButton.positionType = CCPositionTypeNormalized;
    playButton.position = ccp(0.5f, 0.35f);
    [playButton setTarget:self selector:@selector(onPlayClicked:)];
    [self addChild:playButton];

    // done
    return self;
}

// Call TicTacToe game scene
- (void)onPlayClicked:(id)sender {
    [[CCDirector sharedDirector] replaceScene:[TicTacToeScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.3f]];
}

@end
