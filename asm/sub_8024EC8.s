	.syntax unified
	.set sub_80D65D8, 0x080D65D8 + 1
	.section .text.sub_8024EC8, "ax", %progbits
@ sub_8024EC8 @ JP 0x08024EC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024EC8
	.thumb_func
sub_8024EC8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08024F18 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08024F10
_08024ED8:
	ldr r0, _08024F18 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08024F0A
_08024EE6:
	ldr r0, _08024F1C @ =0x0202E4E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024F04
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80D65D8
_08024F04:
	subs r4, #1
	cmp r4, #0
	bge _08024EE6
_08024F0A:
	adds r5, r6, #0
	cmp r5, #0
	bge _08024ED8
_08024F10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F18: .4byte 0x0202E4D0
_08024F1C: .4byte 0x0202E4E0

