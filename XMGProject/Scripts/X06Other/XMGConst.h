
#import <UIKit/UIKit.h>
typedef enum{
    xmgTypeWord=29,
    xmgTypeSound=31,
    xmgTypeTexture=10,
    XmgTypeVideo=41,
    xmgTypeAll=1
}xmgEnumType;

UIKIT_EXTERN CGFloat const xmgTableViewH;
UIKIT_EXTERN CGFloat const xmgTableViewY;

UIKIT_EXTERN CGFloat const xmgCellTop;
UIKIT_EXTERN CGFloat const xmgCellBottom;
/** cell的间隔  */
UIKIT_EXTERN CGFloat const xmgCellMargin;
/** cell的图片最大高度  */
UIKIT_EXTERN CGFloat const xmgCellTextureMaxH;
/** cell的图片超出最大高度 而显示的高度  */
UIKIT_EXTERN CGFloat const xmgCellTextureBeyondH;