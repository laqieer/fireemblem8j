	.syntax unified
	.set AiClearDecision, 0x08039C78 + 1
	.set sub_803BF14, 0x0803BF14 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.section .text.sub_803F5AC, "ax", %progbits
@ sub_803F5AC @ JP 0x0803F5AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F5AC
	.thumb_func
sub_803F5AC:
	push {lr}
	ldr r2, _0803F5CC @ =0x0203AA9C
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl sub_803BF14
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F5D4
	ldr r0, _0803F5D0 @ =0x0203AA00
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F5FC
	.align 2, 0
_0803F5CC: .4byte 0x0203AA9C
_0803F5D0: .4byte 0x0203AA00
_0803F5D4:
	ldr r0, _0803F604 @ =sub_803F570
	bl sub_803D3E0
	ldr r0, _0803F608 @ =0x0203AA00
	adds r2, r0, #0
	adds r2, #0x86
	movs r0, #0
	strb r0, [r2]
	ldr r1, _0803F60C @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F5F8
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F5F8
	ldrb r0, [r1, #6]
	strb r0, [r2]
_0803F5F8:
	bl AiClearDecision
_0803F5FC:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803F604: .4byte 0x0803F571  @ sub_803F570
_0803F608: .4byte 0x0203AA00
_0803F60C: .4byte 0x0203AA90

