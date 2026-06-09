	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_8078EF4, "ax", %progbits
@ sub_8078EF4 @ JP 0x08078EF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078EF4
	.thumb_func
sub_8078EF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08078F58
	ldr r0, _08078F40 @ =0x02000028
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08078F44 @ =0x02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	ldr r6, _08078F48 @ =0x0201FB0C
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r5, _08078F4C @ =0x03004F90
	ldr r0, [r5]
	subs r1, r1, r0
	mov sb, r1
	ldr r4, _08078F50 @ =0x0200002C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	ldr r3, _08078F54 @ =0x03004F94
	ldr r0, [r3]
	subs r7, r1, r0
	mov r0, r8
	mov r8, r6
	b _08078F84
	.align 2, 0
_08078F40: .4byte 0x02000028
_08078F44: .4byte 0x02017760
_08078F48: .4byte 0x0201FB0C
_08078F4C: .4byte 0x03004F90
_08078F50: .4byte 0x0200002C
_08078F54: .4byte 0x03004F94
_08078F58:
	ldr r5, _08078FD0 @ =0x02000028
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r2, _08078FD4 @ =0x02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	adds r1, r1, r0
	ldr r4, _08078FD8 @ =0x0201FB0C
	ldr r0, [r4]
	subs r1, r1, r0
	mov sb, r1
	ldr r3, _08078FDC @ =0x0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r6, #2
	ldrsh r0, [r2, r6]
	subs r7, r1, r0
	adds r0, r5, #0
	mov r8, r4
	ldr r5, _08078FE0 @ =0x03004F90
	adds r4, r3, #0
	ldr r3, _08078FE4 @ =0x03004F94
_08078F84:
	movs r1, #2
	ldrsh r0, [r0, r1]
	movs r6, #0
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	mov r6, r8
	ldr r1, [r6]
	subs r0, r0, r1
	ldr r1, [r5]
	subs r5, r0, r1
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r4, #2
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ldr r1, [r3]
	subs r4, r0, r1
	ldr r0, _08078FE8 @ =0x0203E11C
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	bne _08078FEC
	mov r0, sb
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
	b _08079020
	.align 2, 0
_08078FD0: .4byte 0x02000028
_08078FD4: .4byte 0x02017760
_08078FD8: .4byte 0x0201FB0C
_08078FDC: .4byte 0x0200002C
_08078FE0: .4byte 0x03004F90
_08078FE4: .4byte 0x03004F94
_08078FE8: .4byte 0x0203E11C
_08078FEC:
	cmp r0, #0
	blt _08079020
	cmp r0, #2
	bgt _08079020
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08079012
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	b _08079020
_08079012:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
_08079020:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

