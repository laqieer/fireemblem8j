	.syntax unified
	.section .text.sub_8040A60, "ax", %progbits
@ sub_8040A60 @ JP 0x08040A60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040A60
	.thumb_func
sub_8040A60:
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08040A98 @ =0x0202E4E0
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040A94
	ldr r0, _08040A9C @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08040AA4
	ldr r0, _08040AA0 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r2, r0
	beq _08040AA4
_08040A94:
	movs r0, #0xff
	b _08040AB0
	.align 2, 0
_08040A98: .4byte 0x0202E4E0
_08040A9C: .4byte 0x0202E4D4
_08040AA0: .4byte 0x0202BE40
_08040AA4:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08040AB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

