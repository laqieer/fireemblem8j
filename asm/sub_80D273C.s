	.syntax unified
	.set sub_8003D84, 0x08003D84 + 1
	.section .text.sub_80D273C, "ax", %progbits
@ sub_80D273C @ JP 0x080D273C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D273C
	.thumb_func
sub_80D273C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080D2764
_080D2744:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _080D2760
	adds r0, r1, #0
	adds r0, #0x34
	movs r1, #0
	bl sub_8003D84
_080D2760:
	adds r4, #1
	adds r0, r5, #0
_080D2764:
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r4, r0
	blt _080D2744
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

