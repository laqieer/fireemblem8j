	.syntax unified
	.set sub_8074DE8, 0x08074DE8 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805CFB8, "ax", %progbits
@ EfxTeonoSeMain @ JP 0x0805CFB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxTeonoSeMain
	.thumb_func
EfxTeonoSeMain:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805CFF8
	ldr r0, [r4, #0x60]
	bl sub_8074DE8
	ldr r1, [r4, #0x60]
	ldrh r2, [r1, #2]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xcd
	movs r3, #1
	bl sub_8074E80
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _0805CFF8
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_0805CFF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

