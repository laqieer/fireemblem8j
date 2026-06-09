	.syntax unified
	.set GetCameraCenteredX, 0x08015A5C + 1
	.set GetCameraCenteredY, 0x08015A88 + 1
	.set ReadExtraMapInfo, 0x080AB6A4 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_8019194, 0x08019194 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8030D24, 0x08030D24 + 1
	.set sub_8031108, 0x08031108 + 1
	.set sub_803124C, 0x0803124C + 1
	.set sub_8031288, 0x08031288 + 1
	.set sub_8031308, 0x08031308 + 1
	.set sub_8031344, 0x08031344 + 1
	.set sub_80313C0, 0x080313C0 + 1
	.section .text.sub_8030F30, "ax", %progbits
@ sub_8030F30 @ JP 0x08030F30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030F30
	.thumb_func
sub_8030F30:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08030FB4 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _08030F44
	bl ReadExtraMapInfo
_08030F44:
	movs r0, #0
	bl sub_8001ACC
	ldr r0, _08030FB8 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _08030FBC @ =sub_80152C8
	bl sub_8001208
	bl sub_8030D24
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl SetCursorMapPosition
	bl sub_8015710
	bl sub_80265CC
	bl ResetUnitSprites
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_8019194
	ldr r4, _08030FC0 @ =0x0202BCAC
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8031108
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldr r0, _08030FC4 @ =0x0203A954
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _0803101A
	lsls r0, r0, #2
	ldr r1, _08030FC8 @ =_08030FCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030FB4: .4byte 0x0202BCEC
_08030FB8: .4byte 0x08015319  @ sub_8015318
_08030FBC: .4byte 0x080152C9  @ sub_80152C8
_08030FC0: .4byte 0x0202BCAC
_08030FC4: .4byte 0x0203A954
_08030FC8: .4byte _08030FCC
_08030FCC: @ jump table
	.4byte _08030FFC @ case 0
	.4byte _08030FF4 @ case 1
	.4byte _08030FFC @ case 2
	.4byte _08031004 @ case 3
	.4byte _0803100C @ case 4
	.4byte _0803101A @ case 5
	.4byte _0803101A @ case 6
	.4byte _0803101A @ case 7
	.4byte _0803101A @ case 8
	.4byte _08031014 @ case 9
_08030FF4:
	adds r0, r5, #0
	bl sub_8031288
	b _0803101A
_08030FFC:
	adds r0, r5, #0
	bl sub_803124C
	b _0803101A
_08031004:
	adds r0, r5, #0
	bl sub_8031308
	b _0803101A
_0803100C:
	adds r0, r5, #0
	bl sub_8031344
	b _0803101A
_08031014:
	adds r0, r5, #0
	bl sub_80313C0
_0803101A:
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

