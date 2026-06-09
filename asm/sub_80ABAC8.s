	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set WriteWorldMapPaths, 0x080AB8C8 + 1
	.set WriteWorldMapSkirmishes, 0x080ABA4C + 1
	.set WriteWorldMapUnits, 0x080AB968 + 1
	.set sub_80AB7B8, 0x080AB7B8 + 1
	.section .text.sub_80ABAC8, "ax", %progbits
@ sub_80ABAC8 @ JP 0x080ABAC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABAC8
	.thumb_func
sub_80ABAC8:
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	mov r1, sp
	bl sub_80AB7B8
	add r1, sp, #8
	adds r0, r4, #0
	bl WriteWorldMapPaths
	add r1, sp, #0xc
	adds r0, r4, #0
	bl WriteWorldMapUnits
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl WriteWorldMapSkirmishes
	adds r0, r4, #0
	adds r0, #0xcc
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0]
	mov r1, sp
	ldrh r0, [r4, #2]
	strb r0, [r1, #0x1a]
	ldrh r0, [r4, #4]
	strb r0, [r1, #0x1b]
	mov r5, sp
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1f
	ldrb r1, [r5, #0x1c]
	movs r2, #2
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #0x1c]
	mov r4, sp
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1f
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x1c]
	mov r2, sp
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	lsls r3, r3, #2
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0

