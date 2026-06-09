	.syntax unified
	.section .text.__mcmp, "ax", %progbits
@ __mcmp @ JP 0x080D9E88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __mcmp
	.thumb_func
__mcmp:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _080D9EC4
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_080D9EA6:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _080D9EBE
	movs r1, #1
	cmp r0, r2
	bhs _080D9EBA
	subs r1, #2
_080D9EBA:
	adds r0, r1, #0
	b _080D9EC4
_080D9EBE:
	cmp r3, r4
	bhi _080D9EA6
	movs r0, #0
_080D9EC4:
	pop {r4, r5, pc}
	.align 2, 0

