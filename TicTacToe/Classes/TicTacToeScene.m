//
//  TicTacToeScene.m
//  TicTacToe
//
//  Created by Matheus Felipe on 12/02/14.
//  Copyright matbhz 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "TicTacToeScene.h"
#import "IntroScene.h"

// -----------------------------------------------------------------------
#pragma mark - TicTacToeScene
// -----------------------------------------------------------------------

@implementation TicTacToeScene {
    CCSprite *sprite;

    // TODO: Create a class to encapsulate CGRect and a boolean for already played square
    CGRect topLeftSquare;
    CGRect topMiddleSquare;
    CGRect topRightSquare;

    CGRect middleLeftSquare;
    CGRect middleMiddleSquare;
    CGRect middleRightSquare;

    CGRect bottomLeftSquare;
    CGRect bottomMiddleSquare;
    CGRect bottomRightSquare;

}

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (TicTacToeScene *)scene {
    return [[self alloc] init];
}

- (id)init {
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return (nil);

    // Enable touch handling on scene node
    self.userInteractionEnabled = YES;

    // Create playable squares
    topLeftSquare = CGRectMake(0, 0, 100, 100);


    //TODO: Resize image to fit on the screen
    CCNode *background = [CCSprite spriteWithImageNamed:@"Chalkboard.jpg"];
    [self addChild:background];

    //TODO: Better (and smart) calculation of the horizontal lines height
    CCNode *firstVerticalChalkLine = [self createChalkLineWithWidth:self.contentSize.width / 3 height:self.contentSize.height / 2 rotation:0.0f];
    [self addChild:firstVerticalChalkLine];

    CCNode *secondVerticalChalkLine = [self createChalkLineWithWidth:self.contentSize.width / 3 * 2 height:self.contentSize.height / 2 rotation:0.0f];
    [self addChild:secondVerticalChalkLine];

    CCNode *firstHorizontalChalkLine = [self createChalkLineWithWidth:self.contentSize.width / 2 height:340.0f rotation:90.0f];
    [self addChild:firstHorizontalChalkLine];

    CCNode *secondHorizontalChalkLine = [self createChalkLineWithWidth:self.contentSize.width / 2 height:230.0f rotation:90.0f];
    [self addChild:secondHorizontalChalkLine];

    // Button - Back to main menu
    CCButton *backButton = [CCButton buttonWithTitle:@"Main menu" fontName:@"Chalkduster" fontSize:25.0f];
    backButton.positionType = CCPositionTypeNormalized;
    backButton.position = ccp(0.65f, 0.95f); // Top Right of screen
    [backButton setTarget:self selector:@selector(onBackClicked:)];
    [self addChild:backButton];

    // done
    return self;
}

- (CCNode *)createChalkLineWithWidth:(float)width height:(float)height rotation:(float)rotation {
    CCNode *chalkLine = [CCSprite spriteWithImageNamed:@"ChalkLineTexture-iPhone-HD.png"];
    chalkLine.position = CGPointMake(width, height);
    chalkLine.rotation = rotation;
    chalkLine.scale = 0.5f;

    chalkLine.opacity = 0.0f;
    CCAction *animation = [CCActionFadeIn actionWithDuration:1.0f];
    [chalkLine runAction:animation];

    return chalkLine;
}

// -----------------------------------------------------------------------

- (void)dealloc {
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter {
    // always call super onEnter first
    [super onEnter];

    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Pr frame update is automatically enabled, if update is overridden

}

// -----------------------------------------------------------------------

- (void)onExit {
    // always call super onExit last
    [super onExit];
}

// -----------------------------------------------------------------------
#pragma mark - Touch Handler
// -----------------------------------------------------------------------

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchtLocationPoint = [touch locationInNode:self];

    // Log touch location
    CCLOG(@"Move sprite to @ %@", NSStringFromCGPoint(touchtLocationPoint));

    if (CGRectContainsPoint(topLeftSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(topMiddleSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(topRightSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(middleLeftSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(middleMiddleSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(middleRightSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(bottomLeftSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(bottomMiddleSquare, touchtLocationPoint)) {

    } else if (CGRectContainsPoint(bottomRightSquare, touchtLocationPoint)) {

    }

}

//
- (void)onBackClicked:(id)sender {
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:0.3f]];
}
@end