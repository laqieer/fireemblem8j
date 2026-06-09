	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B1F40, "ax", %progbits
@ sub_80B1F40 @ JP 0x080B1F40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1F40
	.thumb_func
sub_80B1F40:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080B1F78 @ =0x08A9DB84
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080B1F70
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080B1F7C @ =0x08A99F80
	ldr r2, _080B1F80 @ =0x06010000
	adds r1, r5, r2
	bl sub_8013008
_080B1F70:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F78: .4byte 0x08A9DB84
_080B1F7C: .4byte 0x08A99F80
_080B1F80: .4byte 0x06010000

