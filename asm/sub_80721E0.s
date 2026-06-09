	.syntax unified
	.section .text.sub_80721E0, "ax", %progbits
@ sub_80721E0 @ JP 0x080721E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80721E0
	.thumb_func
sub_80721E0:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080721FC @ =0x02019790
	lsrs r1, r0, #0x10
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
_080721EE:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bne _080721EE
	pop {r0}
	bx r0
	.align 2, 0
_080721FC: .4byte 0x02019790

