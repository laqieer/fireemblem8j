	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_80BDCDC, "ax", %progbits
@ sub_80BDCDC @ JP 0x080BDCDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDCDC
	.thumb_func
sub_80BDCDC:
	push {r4, lr}
	ldr r0, _080BDD10 @ =0x08B1CCD4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080BDD14 @ =0x08B1B59C
	ldr r1, _080BDD18 @ =0x06011000
	bl sub_8013008
	ldr r0, _080BDD1C @ =0x08B1C6A4
	ldr r4, _080BDD20 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _080BDD24 @ =0x06010280
	adds r0, r4, #0
	movs r2, #0xc
	movs r3, #4
	bl sub_80130D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD10: .4byte 0x08B1CCD4
_080BDD14: .4byte 0x08B1B59C
_080BDD18: .4byte 0x06011000
_080BDD1C: .4byte 0x08B1C6A4
_080BDD20: .4byte 0x02020188
_080BDD24: .4byte 0x06010280

