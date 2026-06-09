	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.set sub_801E3A4, 0x0801E3A4 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_8023990, "ax", %progbits
@ sub_8023990 @ JP 0x08023990 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023990
	.thumb_func
sub_8023990:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08023A0C @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r4, _08023A10 @ =0x0202E4E0
	ldr r0, [r4]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r4]
	bl sub_801B668
	ldr r4, _08023A14 @ =0x03004DF0
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8037A24
	adds r5, r0, #0
	bl sub_801E3A4
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl sub_801B674
	movs r0, #2
	bl sub_801D6FC
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023A0C: .4byte 0x0202E4DC
_08023A10: .4byte 0x0202E4E0
_08023A14: .4byte 0x03004DF0

