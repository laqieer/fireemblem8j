	.syntax unified
	.set m4aMPlayImmInit, 0x080D50E4 + 1
	.set sub_80027E0, 0x080027E0 + 1
	.section .text.sub_8002398, "ax", %progbits
@ sub_8002398 @ JP 0x08002398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002398
	.thumb_func
sub_8002398:
	push {r4, lr}
	ldr r3, _080023BC @ =0x02024E5C
	movs r4, #0
	movs r2, #1
	strb r2, [r3, #6]
	strb r4, [r3, #7]
	strh r0, [r3, #4]
	bl sub_80027E0
	ldr r0, _080023C0 @ =0x03006430
	bl m4aMPlayImmInit
	ldr r0, _080023C4 @ =0x03006640
	bl m4aMPlayImmInit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080023BC: .4byte 0x02024E5C
_080023C0: .4byte 0x03006430
_080023C4: .4byte 0x03006640

