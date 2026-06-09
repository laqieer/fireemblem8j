	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80112FC, "ax", %progbits
@ sub_80112FC @ JP 0x080112FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80112FC
	.thumb_func
sub_80112FC:
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801131A
	ldr r0, _08011320 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801131A
	ldrh r0, [r1]
	bl m4aSongNumStart
_0801131A:
	pop {r0}
	bx r0
	.align 2, 0
_08011320: .4byte 0x0202BCEC

