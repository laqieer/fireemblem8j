	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_80B54AC, 0x080B54AC + 1
	.set sub_80B5640, 0x080B5640 + 1
	.section .text.sub_80B5E00, "ax", %progbits
@ sub_80B5E00 @ JP 0x080B5E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5E00
	.thumb_func
sub_80B5E00:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0x2a
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	ldr r1, _080B5E48 @ =0x08A9E50C
	mov sb, r1
	ldr r0, [r1]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, _080B5E4C @ =0x08A9E500
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r5, [r6]
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B5E50 @ =0x08A9E4F8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r7, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080B5E54
	movs r0, #0
	b _080B5E96
	.align 2, 0
_080B5E48: .4byte 0x08A9E50C
_080B5E4C: .4byte 0x08A9E500
_080B5E50: .4byte 0x08A9E4F8
_080B5E54:
	adds r0, r5, #0
	bl sub_80B5640
	ldrb r0, [r6]
	bl sub_80B54AC
	mov r0, r8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _080B5E7C
	adds r0, r7, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080B5E94
_080B5E7C:
	mov r0, sb
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r4, [r0, #4]
	adds r0, r7, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_080B5E94:
	movs r0, #1
_080B5E96:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

