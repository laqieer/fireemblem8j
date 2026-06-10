	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_803744C, "ax", %progbits
@ sub_803744C @ JP 0x0803744C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803744C
	.thumb_func
sub_803744C:
	push {lr}
	ldr r0, _08037470 @ =0x085C6A48
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0803746C
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803746C
	adds r1, #0x34
	movs r0, #1
	strb r0, [r1]
_0803746C:
	pop {r0}
	bx r0
	.align 2, 0
_08037470: .4byte 0x085C6A48

