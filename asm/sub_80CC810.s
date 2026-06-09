	.syntax unified
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80CC810, "ax", %progbits
@ sub_80CC810 @ JP 0x080CC810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC810
	.thumb_func
sub_80CC810:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, _080CC8F4 @ =OpAnimHBlank1
	bl SetPrimaryHBlankHandler
	ldr r7, _080CC8F8 @ =0x03003020
	ldrb r2, [r7, #1]
	movs r0, #0x20
	orrs r2, r0
	subs r0, #0x61
	ands r2, r0
	movs r0, #0x7f
	ands r2, r0
	ldr r1, _080CC8FC @ =0x03003054
	ldrb r3, [r1]
	movs r0, #1
	mov sb, r0
	mov r1, sb
	orrs r3, r1
	movs r6, #2
	orrs r3, r6
	movs r0, #4
	mov r8, r0
	mov r1, r8
	orrs r3, r1
	movs r5, #8
	orrs r3, r5
	movs r4, #0x10
	orrs r3, r4
	movs r0, #0x35
	adds r0, r0, r7
	mov ip, r0
	ldrb r0, [r0]
	mov r1, sb
	orrs r0, r1
	orrs r0, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x36
	adds r0, r0, r7
	mov sl, r0
	ldrb r1, [r0]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r6
	mov r1, r8
	orrs r0, r1
	orrs r0, r5
	orrs r0, r4
	mov r1, sb
	orrs r2, r1
	orrs r2, r6
	mov r1, r8
	orrs r2, r1
	orrs r2, r5
	orrs r2, r4
	strb r2, [r7, #1]
	movs r1, #0x20
	orrs r3, r1
	ldr r1, _080CC8FC @ =0x03003054
	strb r3, [r1]
	movs r1, #0x20
	orrs r0, r1
	mov r1, sl
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r4, #0
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	ldr r0, _080CC900 @ =0x02022188
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x30
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
	ldr r0, [sp, #4]
	bl sub_8002DE4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC8F4: .4byte 0x080CC755  @ OpAnimHBlank1
_080CC8F8: .4byte 0x03003020
_080CC8FC: .4byte 0x03003054
_080CC900: .4byte 0x02022188

