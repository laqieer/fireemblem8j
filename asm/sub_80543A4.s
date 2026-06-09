	.syntax unified
	.set SetEkrBg2QuakeVec, 0x08052F0C + 1
	.section .text.sub_80543A4, "ax", %progbits
@ sub_80543A4 @ JP 0x080543A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80543A4
	.thumb_func
sub_80543A4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, r0, r3
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _080543D0 @ =0x00007FFF
	cmp r1, r0
	beq _080543D4
	adds r0, r1, #0
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl SetEkrBg2QuakeVec
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	b _080543FC
	.align 2, 0
_080543D0: .4byte 0x00007FFF
_080543D4:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080543E4
	cmp r0, #1
	beq _080543F4
	b _080543FC
_080543E4:
	strh r0, [r4, #0x2c]
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl SetEkrBg2QuakeVec
	b _080543FC
_080543F4:
	movs r0, #0
	movs r1, #0
	bl SetEkrBg2QuakeVec
_080543FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

