	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1844, "ax", %progbits
@ sub_80B1844 @ JP 0x080B1844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1844
	.thumb_func
sub_80B1844:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1878 @ =0x08A9DAFC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B1872
	cmp r4, #0
	bne _080B185C
	movs r0, #1
	str r0, [r1, #0x4c]
_080B185C:
	cmp r4, #1
	bne _080B1862
	str r4, [r1, #0x50]
_080B1862:
	cmp r4, #2
	bne _080B186A
	movs r0, #1
	str r0, [r1, #0x4c]
_080B186A:
	cmp r4, #3
	bne _080B1872
	movs r0, #1
	str r0, [r1, #0x50]
_080B1872:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1878: .4byte 0x08A9DAFC

