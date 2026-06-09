	.syntax unified
	.section .text.IsShopPageScrolling, "ax", %progbits
@ IsShopPageScrolling @ JP 0x080BA250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsShopPageScrolling
	.thumb_func
IsShopPageScrolling:
	push {lr}
	ldr r0, _080BA268 @ =0x08ABCAD0
	ldr r0, [r0]
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #8]
	muls r0, r1, r0
	cmp r2, r0
	bne _080BA26C
	movs r0, #0
	b _080BA26E
	.align 2, 0
_080BA268: .4byte 0x08ABCAD0
_080BA26C:
	movs r0, #1
_080BA26E:
	pop {r1}
	bx r1
	.align 2, 0

