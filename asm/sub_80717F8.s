	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_80717F8, "ax", %progbits
@ sub_80717F8 @ JP 0x080717F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80717F8
	.thumb_func
sub_80717F8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _0807183C @ =0x08603D48
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071840 @ =0x080E4BAE
	str r0, [r4, #0x48]
	ldr r0, _08071844 @ =0x08603E68
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _08071848 @ =0x08603D60
	str r0, [r4, #0x54]
	ldr r0, _0807184C @ =0x08603DE4
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807183C: .4byte 0x08603D48
_08071840: .4byte 0x080E4BAE
_08071844: .4byte 0x08603E68
_08071848: .4byte 0x08603D60
_0807184C: .4byte 0x08603DE4

