	.syntax unified
	.set GetBattleAnimPreconfType, 0x0802C9D0 + 1
	.set WriteSuspendSave, 0x080AA460 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80376A8, 0x080376A8 + 1
	.set sub_8037720, 0x08037720 + 1
	.section .text.sub_803780C, "ax", %progbits
@ sub_803780C @ JP 0x0803780C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803780C
	.thumb_func
sub_803780C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0803782C @ =0x03004DF0
	ldr r0, [r4]
	bl sub_8018E64
	cmp r0, #0
	ble _08037826
	ldr r0, [r4]
	bl sub_80376A8
	cmp r0, #0
	bne _08037830
_08037826:
	movs r0, #1
	b _08037858
	.align 2, 0
_0803782C: .4byte 0x03004DF0
_08037830:
	ldr r1, _08037860 @ =0x0203A954
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl WriteSuspendSave
	bl GetBattleAnimPreconfType
	cmp r0, #1
	bne _0803784A
	bl sub_8027144
_0803784A:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_8037720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08037858:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08037860: .4byte 0x0203A954

