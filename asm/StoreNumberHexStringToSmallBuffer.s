	.syntax unified
	.set ClearSmallStringBuffer, 0x08003814 + 1
	.section .text.StoreNumberHexStringToSmallBuffer, "ax", %progbits
@ StoreNumberHexStringToSmallBuffer @ JP 0x080038B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StoreNumberHexStringToSmallBuffer
	.thumb_func
StoreNumberHexStringToSmallBuffer:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl ClearSmallStringBuffer
	movs r2, #7
	ldr r1, _080038F8 @ =0x02028E44
	ldr r3, _080038FC @ =0x080DC3DC
	movs r0, #0xf
	ands r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1, #7]
	asrs r4, r4, #4
	cmp r4, #0
	beq _080038F0
	adds r6, r1, #0
	adds r5, r3, #0
	movs r3, #0xf
_080038D8:
	subs r2, #1
	cmp r2, #0
	blt _080038F0
	adds r0, r2, r6
	adds r1, r4, #0
	ands r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080038D8
_080038F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080038F8: .4byte 0x02028E44
_080038FC: .4byte 0x080DC3DC

