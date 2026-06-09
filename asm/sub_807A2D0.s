	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_807A2D0, "ax", %progbits
@ sub_807A2D0 @ JP 0x0807A2D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A2D0
	.thumb_func
sub_807A2D0:
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _0807A2EC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _0807A2FA
	cmp r0, #1
	bgt _0807A2F0
	cmp r0, #0
	beq _0807A2F6
	b _0807A2FC
	.align 2, 0
_0807A2EC: .4byte 0x0203E11C
_0807A2F0:
	cmp r0, #2
	beq _0807A2FA
	b _0807A2FC
_0807A2F6:
	adds r3, #8
	b _0807A2FC
_0807A2FA:
	adds r3, #0x20
_0807A2FC:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0

