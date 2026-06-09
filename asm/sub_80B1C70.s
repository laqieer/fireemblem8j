	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B1C70, "ax", %progbits
@ sub_80B1C70 @ JP 0x080B1C70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1C70
	.thumb_func
sub_80B1C70:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1C98 @ =0x08A9DB3C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B1C92
	lsls r0, r4, #0xf
	lsrs r0, r0, #0x14
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, _080B1C9C @ =0x08AAF6B4
	ldr r2, _080B1CA0 @ =0x06010000
	adds r1, r4, r2
	bl sub_8013008
_080B1C92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1C98: .4byte 0x08A9DB3C
_080B1C9C: .4byte 0x08AAF6B4
_080B1CA0: .4byte 0x06010000

