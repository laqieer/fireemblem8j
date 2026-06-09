	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set GetUnit, 0x08019108 + 1
	.set ShowUnitSprite, 0x080280C4 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804AA0C, "ax", %progbits
@ sub_804AA0C @ JP 0x0804AA0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AA0C
	.thumb_func
sub_804AA0C:
	push {r4, r5, r6, r7, lr}
	ldr r6, _0804AA7C @ =0x0203DD8C
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq _0804AA74
	ldr r7, _0804AA80 @ =0x03001810
	ldrb r0, [r6, #3]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq _0804AA40
	bl sub_807B4B8
	adds r0, r5, #0
	bl ShowUnitSprite
_0804AA40:
	cmp r4, #0
	beq _0804AA74
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804AA74
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _0804AA84 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0804AA74
	adds r0, r4, #0
	bl sub_807A888
	bl DisableMuCamera
	adds r0, r4, #0
	bl sub_80280A0
_0804AA74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA7C: .4byte 0x0203DD8C
_0804AA80: .4byte 0x03001810
_0804AA84: .4byte 0x085D31E8

