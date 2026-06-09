	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_809F514, 0x0809F514 + 1
	.set sub_809F8E0, 0x0809F8E0 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1DD8, 0x080B1DD8 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809FF10, "ax", %progbits
@ sub_809FF10 @ JP 0x0809FF10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FF10
	.thumb_func
sub_809FF10:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_809F514
	movs r0, #0
	bl sub_80B1524
	adds r0, r4, #0
	bl sub_809F8E0
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80B1FBC
	ldr r0, _0809FF68 @ =sub_809FA74
	bl sub_80B1DD8
	bl Proc_End
	ldr r0, _0809FF6C @ =sub_809FAAC
	bl sub_80B1DD8
	bl Proc_End
	ldr r0, _0809FF70 @ =sub_809FA24
	adds r1, r4, #0
	bl sub_80B1D98
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF68: .4byte 0x0809FA75  @ sub_809FA74
_0809FF6C: .4byte 0x0809FAAD  @ sub_809FAAC
_0809FF70: .4byte 0x0809FA25  @ sub_809FA24

