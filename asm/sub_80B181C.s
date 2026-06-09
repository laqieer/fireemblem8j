	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B181C, "ax", %progbits
@ sub_80B181C @ JP 0x080B181C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B181C
	.thumb_func
sub_80B181C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080B1840 @ =0x08A9DAFC
	bl Proc_Find
	cmp r0, #0
	beq _080B1838
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080B1838:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1840: .4byte 0x08A9DAFC

