	.syntax unified
	.set BMapVSync_End, 0x080300C4 + 1
	.set BMapVSync_Start, 0x080300A0 + 1
	.set ClearTraps, 0x0802E100 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set InitBmBgLayers, 0x08015624 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_8019194, 0x08019194 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_802E2E0, 0x0802E2E0 + 1
	.set sub_80379A8, 0x080379A8 + 1
	.section .text.sub_8030E94, "ax", %progbits
@ sub_8030E94 @ JP 0x08030E94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030E94
	.thumb_func
sub_8030E94:
	push {r4, r5, lr}
	movs r0, #0
	bl sub_8001ACC
	ldr r0, _08030F18 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _08030F1C @ =sub_80152C8
	bl sub_8001208
	bl sub_80156F0
	bl sub_80265CC
	bl ResetUnitSprites
	bl ClearTraps
	ldr r4, _08030F20 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_8019194
	bl sub_802E2E0
	bl sub_80379A8
	bl BMapVSync_End
	bl BMapVSync_Start
	ldr r0, _08030F24 @ =0x085C5DE8
	movs r1, #4
	bl sub_8002BCC
	ldr r0, _08030F28 @ =0x020228A8
	strh r5, [r0]
	bl sub_8001EE4
	ldr r2, _08030F2C @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030F18: .4byte 0x08015319  @ sub_8015318
_08030F1C: .4byte 0x080152C9  @ sub_80152C8
_08030F20: .4byte 0x0202BCEC
_08030F24: .4byte 0x085C5DE8
_08030F28: .4byte 0x020228A8
_08030F2C: .4byte 0x03003020

