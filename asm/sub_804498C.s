	.syntax unified
	.section .text.sub_804498C, "ax", %progbits
@ sub_804498C @ JP 0x0804498C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804498C
	.thumb_func
sub_804498C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #1
	adds r2, #0x36
	adds r2, r2, r4
	movs r0, #0
	ldrsh r3, [r2, r0]
	lsls r0, r3, #6
	ldr r5, _080449B0 @ =0x080DD41C
	adds r2, r0, r5
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #2
	b _080449C2
	.align 2, 0
_080449B0: .4byte 0x080DD41C
_080449B4:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r4
	movs r2, #0
	ldrsh r3, [r0, r2]
	lsls r0, r3, #6
	adds r2, r0, r5
_080449C2:
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080449B4
	strh r3, [r6, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

