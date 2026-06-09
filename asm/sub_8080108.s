	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_8080108, "ax", %progbits
@ sub_8080108 @ JP 0x08080108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080108
	.thumb_func
sub_8080108:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x87
	bl sub_8014B50
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8080CB8
	ldr r0, _0808015C @ =0x08A22498
	ldr r1, _08080160 @ =0x06013800
	bl sub_8013008
	ldr r0, _08080164 @ =0x08A22770
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08080168 @ =0x08A22790
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	ldr r3, _0808016C @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	adds r5, #0x48
	movs r0, #1
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808015C: .4byte 0x08A22498
_08080160: .4byte 0x06013800
_08080164: .4byte 0x08A22770
_08080168: .4byte 0x08A22790
_0808016C: .4byte 0x000041C0

