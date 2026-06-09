	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_803633C, "ax", %progbits
@ sub_803633C @ JP 0x0803633C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803633C
	.thumb_func
sub_803633C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0xb
	beq _0803634A
	cmp r0, #0xd
	bne _08036376
_0803634A:
	ldr r4, _08036394 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _08036398 @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
_08036376:
	ldr r0, _08036394 @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036394: .4byte 0x0203A954
_08036398: .4byte 0xFFFFFBBD

