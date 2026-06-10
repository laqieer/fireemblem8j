	.syntax unified
	.set AiClearDecision, 0x08039C78 + 1
	.set AiExecFallbackScriptA, 0x0803C4A0 + 1
	.set AiTryExecScriptA, 0x0803C44C + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set GetUnitLeaderCharId, 0x08019018 + 1
	.section .text.sub_803F4AC, "ax", %progbits
@ sub_803F4AC @ JP 0x0803F4AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F4AC
	.thumb_func
sub_803F4AC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803F4E4 @ =0x0202BE40
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803F4E8 @ =0x03004DF0
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803F556
	bl GetUnitFromCharId
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803F4F0
	str r6, [r4]
	ldr r0, _0803F4EC @ =0x0203AA00
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F556
	.align 2, 0
_0803F4E4: .4byte 0x0202BE40
_0803F4E8: .4byte 0x03004DF0
_0803F4EC: .4byte 0x0203AA00
_0803F4F0:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803F4FE:
	bl AiTryExecScriptA
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F514
	adds r5, #1
	cmp r5, #0xff
	ble _0803F4FE
	bl AiExecFallbackScriptA
_0803F514:
	ldr r1, _0803F52C @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F534
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F534
	ldr r0, _0803F530 @ =0x0203AA00
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803F53A
	.align 2, 0
_0803F52C: .4byte 0x0203AA90
_0803F530: .4byte 0x0203AA00
_0803F534:
	ldr r0, _0803F564 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #0
_0803F53A:
	strb r1, [r0]
	bl AiClearDecision
	ldr r1, _0803F568 @ =0x03004DF0
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803F56C @ =0x0202BE40
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
_0803F556:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F564: .4byte 0x0203AA00
_0803F568: .4byte 0x03004DF0
_0803F56C: .4byte 0x0202BE40

