	.syntax unified
	.set AiUpdateDecision, 0x08039CDC + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_803A800, 0x0803A800 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.section .text.sub_803CB64, "ax", %progbits
@ sub_803CB64 @ JP 0x0803CB64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CB64
	.thumb_func
sub_803CB64:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CBD4 @ =0x030017C8
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A800
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CC08
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA10
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _0803CBD8 @ =0x0203AA90
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl sub_803BF60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CC0E
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _0803CBE0
	ldr r0, _0803CBDC @ =0x0203AA00
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _0803CC0E
	.align 2, 0
_0803CBD4: .4byte 0x030017C8
_0803CBD8: .4byte 0x0203AA90
_0803CBDC: .4byte 0x0203AA00
_0803CBE0:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, _0803CC00 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _0803CC04 @ =0x030017C0
	strb r4, [r0]
	b _0803CC0E
	.align 2, 0
_0803CC00: .4byte 0x0203AA00
_0803CC04: .4byte 0x030017C0
_0803CC08:
	ldr r1, _0803CC1C @ =0x030017C0
	movs r0, #0
	strb r0, [r1]
_0803CC0E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC1C: .4byte 0x030017C0

