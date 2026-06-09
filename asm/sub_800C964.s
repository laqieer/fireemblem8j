	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C3144, 0x080C3144 + 1
	.section .text.sub_800C964, "ax", %progbits
@ sub_800C964 @ JP 0x0800C964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C964
	.thumb_func
sub_800C964:
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x38]
	movs r1, #4
	ldrsh r4, [r0, r1]
	movs r1, #8
	ldrsh r5, [r0, r1]
	movs r1, #0xa
	ldrsh r6, [r0, r1]
	ldr r0, _0800C990 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80C3144
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800C990: .4byte 0x08AC1108

