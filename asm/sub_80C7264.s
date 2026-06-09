	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C7264, "ax", %progbits
@ sub_80C7264 @ JP 0x080C7264 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7264
	.thumb_func
sub_80C7264:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080C727C @ =0x08AC2510
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _080C7280
	movs r0, #0
	b _080C728A
	.align 2, 0
_080C727C: .4byte 0x08AC2510
_080C7280:
	ldrh r0, [r1, #0x2e]
	strh r0, [r4]
	ldrh r0, [r1, #0x30]
	strh r0, [r5]
	movs r0, #1
_080C728A:
	pop {r4, r5}
	pop {r1}
	bx r1

