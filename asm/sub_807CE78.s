	.syntax unified
	.set GetSpellAssocReturnBool, 0x0807A69C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_807DF10, 0x0807DF10 + 1
	.section .text.sub_807CE78, "ax", %progbits
@ sub_807CE78 @ JP 0x0807CE78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CE78
	.thumb_func
sub_807CE78:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl SetDefaultColorEffects
	ldr r5, _0807CEC8 @ =0x0203E1EC
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _0807CE92
	cmp r0, #1
	bge _0807CF4A
_0807CE92:
	ldr r0, [r5, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocReturnBool
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CF4A
	adds r1, r5, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0807CED0
	ldr r0, [r5]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _0807CECC @ =0x0202BCAC
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	ble _0807CF38
	subs r0, #0x28
	b _0807CF3A
	.align 2, 0
_0807CEC8: .4byte 0x0203E1EC
_0807CECC: .4byte 0x0202BCAC
_0807CED0:
	ldrb r1, [r1]
	cmp r1, #0
	beq _0807CEF6
	ldr r0, _0807CF08 @ =0x0202BCAC
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	adds r2, r5, #0
	mov r3, sp
_0807CEE0:
	ldr r0, [r2]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	subs r0, r0, r4
	stm r3!, {r0}
	adds r2, #0x14
	subs r1, #1
	cmp r1, #0
	bne _0807CEE0
_0807CEF6:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	subs r1, r0, r2
	adds r3, r0, #0
	cmp r1, #0
	blt _0807CF0C
	cmp r1, #0x4f
	bgt _0807CF12
	b _0807CF16
	.align 2, 0
_0807CF08: .4byte 0x0202BCAC
_0807CF0C:
	subs r0, r2, r3
	cmp r0, #0x4f
	ble _0807CF16
_0807CF12:
	movs r0, #0x40
	b _0807CF3A
_0807CF16:
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r3, r0
	bgt _0807CF20
	movs r1, #1
_0807CF20:
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0x6f
	ble _0807CF38
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	subs r0, #0x28
	b _0807CF3A
_0807CF38:
	adds r0, #0x18
_0807CF3A:
	cmp r0, #0
	bge _0807CF40
	adds r0, #7
_0807CF40:
	asrs r1, r0, #3
	movs r0, #0xf
	adds r2, r6, #0
	bl sub_807DF10
_0807CF4A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

