	.syntax unified
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80CD058, "ax", %progbits
@ sub_80CD058 @ JP 0x080CD058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD058
	.thumb_func
sub_80CD058:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080CD0D0 @ =OpAnimHBlank1
	bl SetPrimaryHBlankHandler
	ldr r2, _080CD0D4 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080CD0D8 @ =0x02022188
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r4, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r0, r5, #0
	bl sub_8002DE4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD0D0: .4byte 0x080CC755  @ OpAnimHBlank1
_080CD0D4: .4byte 0x03003020
_080CD0D8: .4byte 0x02022188

