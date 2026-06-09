	.syntax unified
	.set ReadWorldMapNodes, 0x080AB83C + 1
	.set ReadWorldMapSkirmishes, 0x080ABA6C + 1
	.set ReadWorldMapUnits, 0x080AB9D4 + 1
	.set sub_80AB924, 0x080AB924 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80ABB50, "ax", %progbits
@ sub_80ABB50 @ JP 0x080ABB50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABB50
	.thumb_func
sub_80ABB50:
	push {r4, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080ABBA4 @ =0x03006790
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl sub_80D65C8
	adds r0, r4, #0
	mov r1, sp
	bl ReadWorldMapNodes
	add r1, sp, #8
	adds r0, r4, #0
	bl sub_80AB924
	add r1, sp, #0xc
	adds r0, r4, #0
	bl ReadWorldMapUnits
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl ReadWorldMapSkirmishes
	add r0, sp, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xcc
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABBA8
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	b _080ABBB0
	.align 2, 0
_080ABBA4: .4byte 0x03006790
_080ABBA8:
	ldrb r1, [r4]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
_080ABBB0:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ABBC6
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	b _080ABBCE
_080ABBC6:
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
_080ABBCE:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	ldrb r2, [r4]
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #0x1a]
	strh r0, [r4, #2]
	mov r0, sp
	ldrb r0, [r0, #0x1b]
	strh r0, [r4, #4]
	add sp, #0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

