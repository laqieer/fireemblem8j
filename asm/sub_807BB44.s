	.syntax unified
	.set GetMuImgBufById, 0x0807B96C + 1
	.set MU_SetupPixelEffect, 0x0807BAE8 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_807BB44, "ax", %progbits
@ sub_807BB44 @ JP 0x0807BB44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BB44
	.thumb_func
sub_807BB44:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r0, #0x3c
	ldrb r0, [r0]
	bl GetMuImgBufById
	adds r4, r5, #0
	adds r4, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MU_SetupPixelEffect
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _0807BB94 @ =0x02004BE0
	ldr r1, _0807BB98 @ =0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0807BB8C
	ldr r0, [r5, #0x54]
	bl sub_807B4C8
	adds r0, r5, #0
	bl sub_8002DE4
_0807BB8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB94: .4byte 0x02004BE0
_0807BB98: .4byte 0x06017000

