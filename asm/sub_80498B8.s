	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8042D6C, 0x08042D6C + 1
	.section .text.sub_80498B8, "ax", %progbits
@ PointsNumberMover_Init @ JP 0x080498B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PointsNumberMover_Init
	.thumb_func
PointsNumberMover_Init:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, _0804990C @ =0x080DEF14
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, _08049910 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08049914
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	beq _080498FA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
_080498FA:
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b _0804993C
	.align 2, 0
_0804990C: .4byte 0x080DEF14
_08049910: .4byte 0x085D31E8
_08049914:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08049978 @ =0x085D4128
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	strh r0, [r5, #0x2c]
_0804993C:
	ldr r1, _0804997C @ =0x080DEF74
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, _08049980 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08049984 @ =0x02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl sub_8042D6C
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049978: .4byte 0x085D4128
_0804997C: .4byte 0x080DEF74
_08049980: .4byte 0x02000C60
_08049984: .4byte 0x02000C78

