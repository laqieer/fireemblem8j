	.syntax unified
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_8044694, 0x08044694 + 1
	.section .text.sub_80449D4, "ax", %progbits
@ sub_80449D4 @ JP 0x080449D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80449D4
	.thumb_func
sub_80449D4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	ldrb r1, [r6]
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	cmp r1, r0
	bge _08044A5C
	movs r0, #2
	bl sub_8043190
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl SioStrCpy
	ldrb r0, [r6]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r3, r5, #0
	adds r3, #0x4c
	adds r3, r3, r0
	ldrh r0, [r5, #0x34]
	ldr r1, _08044A44 @ =0x00003FFF
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r3]
	ldrb r0, [r6]
	adds r1, r0, #2
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	cmp r1, r0
	bge _08044A48
	strb r1, [r6]
	b _08044A4C
	.align 2, 0
_08044A44: .4byte 0x00003FFF
_08044A48:
	movs r0, #5
	strh r0, [r5, #0x34]
_08044A4C:
	adds r0, r5, #0
	bl sub_8044694
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _08044A62
_08044A5C:
	movs r0, #0
	bl sub_8043190
_08044A62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

