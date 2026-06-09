	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_80089A4, "ax", %progbits
@ sub_80089A4 @ JP 0x080089A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80089A4
	.thumb_func
sub_80089A4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _08008A10 @ =0x085B9342
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	ldrh r0, [r3]
	ldr r6, _08008A14 @ =0x000003FF
	adds r4, r6, #0
	ands r4, r0
	adds r0, r7, #0
	adds r0, #0x64
	ldrh r0, [r0]
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl PutSprite
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _08008A18 @ =0x085B9328
	mov r4, sb
	ldrh r0, [r4]
	ands r6, r0
	ldr r0, _08008A1C @ =0x030000E8
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008A10: .4byte 0x085B9342
_08008A14: .4byte 0x000003FF
_08008A18: .4byte 0x085B9328
_08008A1C: .4byte 0x030000E8

