	.syntax unified
	.set NewPopup_ItemStealing, 0x08011780 + 1
	.section .text.sub_807CAC0, "ax", %progbits
@ sub_807CAC0 @ JP 0x0807CAC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CAC0
	.thumb_func
sub_807CAC0:
	push {lr}
	adds r1, r0, #0
	ldr r2, _0807CAE0 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807CADA
	ldr r0, [r2, #0x18]
	adds r0, #0x48
	ldrh r0, [r0]
	bl NewPopup_ItemStealing
_0807CADA:
	pop {r0}
	bx r0
	.align 2, 0
_0807CAE0: .4byte 0x0203E1EC

