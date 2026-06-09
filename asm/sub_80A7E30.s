	.syntax unified
	.set IsGameSaveComplete, 0x080A9D24 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.section .text.sub_80A7E30, "ax", %progbits
@ sub_80A7E30 @ JP 0x080A7E30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7E30
	.thumb_func
sub_80A7E30:
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A7E42
	b _080A7E56
_080A7E3E:
	movs r0, #1
	b _080A7E58
_080A7E42:
	movs r4, #0
_080A7E44:
	adds r0, r4, #0
	bl IsGameSaveComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A7E3E
	adds r4, #1
	cmp r4, #2
	ble _080A7E44
_080A7E56:
	movs r0, #0
_080A7E58:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

