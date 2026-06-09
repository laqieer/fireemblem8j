	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80D65D8, 0x080D65D8 + 1
	.section .text.sub_8024E5C, "ax", %progbits
@ sub_8024E5C @ JP 0x08024E5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024E5C
	.thumb_func
sub_8024E5C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08024EBC @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08024EB4
_08024E6C:
	ldr r0, _08024EBC @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08024EAE
	lsls r5, r1, #2
_08024E7C:
	ldr r0, _08024EC0 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024EA8
	ldr r0, _08024EC4 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08024EA8
	bl GetUnit
	bl sub_80D65D8
_08024EA8:
	subs r4, #1
	cmp r4, #0
	bge _08024E7C
_08024EAE:
	adds r1, r6, #0
	cmp r1, #0
	bge _08024E6C
_08024EB4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024EBC: .4byte 0x0202E4D0
_08024EC0: .4byte 0x0202E4E0
_08024EC4: .4byte 0x0202E4D4

