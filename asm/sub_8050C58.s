	.syntax unified
	.set AnimUpdateAll, 0x08004D48 + 1
	.set ClearSprites, 0x080052AC + 1
	.set Proc_Run, 0x08002DD4 + 1
	.set UnregisterEfxSoundSeExist, 0x08073F70 + 1
	.set sub_8005360, 0x08005360 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_80599F8, 0x080599F8 + 1
	.section .text.sub_8050C58, "ax", %progbits
@ sub_8050C58 @ JP 0x08050C58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050C58
	.thumb_func
sub_8050C58:
	push {r4, lr}
	bl ClearSprites
	bl UnregisterEfxSoundSeExist
	bl sub_80153A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08050C74
	ldr r0, _08050CC4 @ =0x02026A70
	ldr r0, [r0, #8]
	bl Proc_Run
_08050C74:
	ldr r4, _08050CC4 @ =0x02026A70
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl sub_8005360
	ldr r0, [r4, #4]
	bl Proc_Run
	bl AnimUpdateAll
	bl sub_80599F8
	ldr r0, [r4, #0x10]
	bl Proc_Run
	ldr r1, _08050CC8 @ =0x02000020
	movs r0, #0
	str r0, [r1]
	ldr r1, _08050CCC @ =0x0201FB04
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	cmp r0, #2
	beq _08050CB6
	ldr r1, _08050CD0 @ =0x02000018
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_08050CB6:
	movs r0, #0xd
	bl sub_8005360
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CC4: .4byte 0x02026A70
_08050CC8: .4byte 0x02000020
_08050CCC: .4byte 0x0201FB04
_08050CD0: .4byte 0x02000018

