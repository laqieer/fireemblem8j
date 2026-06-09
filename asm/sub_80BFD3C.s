	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80BFD3C, "ax", %progbits
@ sub_80BFD3C @ JP 0x080BFD3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFD3C
	.thumb_func
sub_80BFD3C:
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r6, r0, r1
	ldr r5, [r6]
	cmp r5, #0
	beq _080BFD5C
	ldr r0, [r5, #0x40]
	bl AP_Delete
	movs r4, #0
	str r4, [r5, #0x40]
	adds r0, r5, #0
	bl Proc_End
	str r4, [r6]
_080BFD5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

