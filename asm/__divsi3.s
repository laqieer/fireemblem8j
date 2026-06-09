	.syntax unified
	.set nullsub_3, 0x080D668C + 1
	.section .text.__divsi3, "ax", %progbits
@ __divsi3 @ JP 0x080D65F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __divsi3
	.thumb_func
__divsi3:
	cmp r1, #0
	beq _080D6680
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _080D660E
	rsbs r1, r1, #0
_080D660E:
	cmp r0, #0
	bpl _080D6614
	rsbs r0, r0, #0
_080D6614:
	cmp r0, r1
	blo _080D6672
	movs r4, #1
	lsls r4, r4, #0x1c
_080D661C:
	cmp r1, r4
	bhs _080D662A
	cmp r1, r0
	bhs _080D662A
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D661C
_080D662A:
	lsls r4, r4, #3
_080D662C:
	cmp r1, r4
	bhs _080D663A
	cmp r1, r0
	bhs _080D663A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D662C
_080D663A:
	cmp r0, r1
	blo _080D6642
	subs r0, r0, r1
	orrs r2, r3
_080D6642:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D664E
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_080D664E:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D665A
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_080D665A:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D6666
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_080D6666:
	cmp r0, #0
	beq _080D6672
	lsrs r3, r3, #4
	beq _080D6672
	lsrs r1, r1, #4
	b _080D663A
_080D6672:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _080D667C
	rsbs r0, r0, #0
_080D667C:
	pop {r4}
	mov pc, lr
_080D6680:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}
	.align 2, 0

